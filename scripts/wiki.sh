#!/usr/bin/env bash
# LLM Wiki CLI helper
# Usage: ./scripts/wiki.sh <command>

WIKI_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
WIKI_DIR="$WIKI_ROOT/wiki"
RAW_DIR="$WIKI_ROOT/raw"

case "$1" in

  stats)
    echo "=== Wiki Stats ==="
    echo "Raw sources:     $(find "$RAW_DIR" -name "*.md" | wc -l)"
    echo "Wiki pages:      $(find "$WIKI_DIR" -name "*.md" | grep -v "_template" | wc -l)"
    echo "Concepts:        $(find "$WIKI_DIR/concepts" -name "*.md" | grep -v "_template" | wc -l)"
    echo "Entities:        $(find "$WIKI_DIR/entities" -name "*.md" | grep -v "_template" | wc -l)"
    echo "Sources (wiki):  $(find "$WIKI_DIR/sources" -name "*.md" | grep -v "_template" | wc -l)"
    echo "Queries filed:   $(find "$WIKI_DIR/queries" -name "*.md" | grep -v "_template" | wc -l)"
    echo "Log entries:     $(grep -c "^## \[" "$WIKI_DIR/log.md" 2>/dev/null || echo 0)"
    ;;

  log)
    N=${2:-10}
    echo "=== Last $N wiki events ==="
    grep "^## \[" "$WIKI_DIR/log.md" | tail -$N
    ;;

  orphans)
    echo "=== Orphan Pages (no inbound links) ==="
    find "$WIKI_DIR" -name "*.md" | grep -v "_template\|index\|log\|overview" | while read page; do
      filename=$(basename "$page" .md)
      count=$(grep -r "\[\[$filename" "$WIKI_DIR" --include="*.md" | grep -v "$page" | wc -l)
      if [ "$count" -eq 0 ]; then
        echo "  ORPHAN: $(echo $page | sed "s|$WIKI_ROOT/||")"
      fi
    done
    ;;

  search)
    QUERY="$2"
    if [ -z "$QUERY" ]; then echo "Usage: wiki.sh search <term>"; exit 1; fi
    echo "=== Searching wiki for: '$QUERY' ==="
    grep -r "$QUERY" "$WIKI_DIR" --include="*.md" -l | while read f; do
      echo "  $(basename $f): $(grep -m1 "$QUERY" "$f")"
    done
    ;;

  pending)
    echo "=== Raw sources not yet ingested ==="
    find "$RAW_DIR" -name "*.md" | while read raw; do
      slug=$(basename "$raw" .md)
      if [ ! -f "$WIKI_DIR/sources/$slug.md" ]; then
        echo "  PENDING: $(echo $raw | sed "s|$WIKI_ROOT/||")"
      fi
    done
    ;;

  open)
    if [[ "$OSTYPE" == "darwin"* ]]; then
      open -a Obsidian "$WIKI_ROOT"
    else
      echo "Open Obsidian manually and select: $WIKI_ROOT"
    fi
    ;;

  *)
    echo "LLM Wiki CLI"
    echo ""
    echo "Usage: ./scripts/wiki.sh <command>"
    echo ""
    echo "  stats           Wiki statistics"
    echo "  log [N]         Last N log entries (default: 10)"
    echo "  orphans         Pages with no inbound links"
    echo "  search <term>   Search wiki content"
    echo "  pending         Raw sources not yet ingested"
    echo "  open            Open vault in Obsidian (macOS)"
    ;;
esac
