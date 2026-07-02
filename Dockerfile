FROM chrisvel/tududi:1.1.1

# Tududi runs on port 3002 by default
EXPOSE 3002

# Healthcheck for Railway deployment
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 CMD curl -f http://localhost:3002/ || exit 1