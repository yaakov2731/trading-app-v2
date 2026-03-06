#!/bin/bash
# ─────────────────────────────────────────────
# DEPLOY script — ES Extremo Volumen App
# Run once to create repo + GitHub Pages
# ─────────────────────────────────────────────

set -e

echo "=== Autenticando GitHub ==="
gh auth login

echo "=== Creando repo en GitHub ==="
gh repo create trading-app-v2 --public --description "ES Extremo Volumen — Sistema Optimizado (82-100% WR)" --source=. --push

echo "=== Activando GitHub Pages ==="
gh api repos/$(gh api user --jq .login)/trading-app-v2/pages \
  --method POST \
  --field source='{"branch":"main","path":"/"}' 2>/dev/null || true

LOGIN=$(gh api user --jq .login)
echo ""
echo "✅ DEPLOY COMPLETO"
echo "   URL: https://${LOGIN}.github.io/trading-app-v2/"
echo "   (GitHub Pages tarda 1-2 min en activarse)"
