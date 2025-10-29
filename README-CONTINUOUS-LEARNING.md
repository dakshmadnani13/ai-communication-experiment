# 🧠 Continuous Learning Statistical Engine

A sophisticated, self-updating football prediction system that continuously learns and adapts using real-world data, advanced machine learning techniques, and community intelligence.

## 🎯 **SYSTEM OVERVIEW**

This is a **continuous learning statistical engine** that operates as an autonomous data scientist, maximizing predictive accuracy through:

1. **Verified real-world data ingestion** from multiple sources
2. **Adaptive parameter weighting** that evolves over time
3. **Scheduled self-updates** and model evaluation
4. **Community intelligence integration** from spreadsheets and crowd wisdom

## 🏗️ **ARCHITECTURE**

### **Core Components**

#### 1. **Data Ingestion Layer** (`src/data/ingestion.ts`)
- **Verified Sources**: Opta/Stats Perform, Sportradar, API-SPORTS, SportMonks, SportsDataIO
- **Community Integration**: Google Sheets, OneDrive, GitHub CSV files
- **Metadata Tracking**: Source ID, URL, latency, checksum, timestamp
- **Cache Invalidation**: Automatic refresh when data changes

#### 2. **Adaptive Weight Learning** (`src/learning/adaptive_weights.ts`)
- **Gradient Descent**: Projected gradient descent on probability simplex
- **Geometric Blending**: Log-space ensemble of multiple probability sources
- **Temperature Scaling**: Automatic calibration optimization
- **Momentum**: Exponential moving average of gradients for stability

#### 3. **Temporal Scheduler** (`src/scheduler/temporal_loop.ts`)
- **Multi-Interval Updates**: 10min odds, 30min fixtures, 60min news
- **Hash-Based Triggers**: Weight recalibration when data changes
- **Parallel Processing**: Optimized for 8-core systems
- **Fault Tolerance**: Graceful handling of source failures

#### 4. **Quality Ranking System** (`src/scheduler/quality_ranker.ts`)
- **Weekly Rankings**: Accuracy, latency, availability, freshness
- **Source Selection**: Top-3 sources activated automatically
- **Performance Tracking**: Continuous quality score updates
- **Adaptive Switching**: Dynamic source selection based on performance

#### 5. **Self-Evaluation Engine** (`src/scheduler/self_evaluator.ts`)
- **Performance Monitoring**: Brier score, log loss, calibration
- **Hyperparameter Sweeps**: Automatic optimization when plateaued
- **Recommendation System**: Actionable insights for improvement
- **Metrics Archival**: Historical performance tracking

## 🚀 **QUICK START**

### **Prerequisites**
- Node.js 18+
- 8-core CPU (optimized for)
- 16GB RAM (recommended)
- API keys for data sources (optional)

### **Installation & Startup**

```bash
# 1. Install dependencies
npm install
cd frontend && npm install && cd ..

# 2. Build the engine
npm run build:fast

# 3. Start the continuous learning system
start-continuous-learning.bat
```

### **Access Points**
- **Frontend**: http://localhost:3001
- **API**: http://localhost:3000
- **Health**: http://localhost:3000/health
- **Status**: http://localhost:3000/api/v1/status
- **Metrics**: http://localhost:3000/api/v1/metrics

## 📊 **API ENDPOINTS**

### **Prediction Endpoints**

#### `POST /api/v1/predict`
Get predictions using the continuous learning engine.

```json
{
  "odds": { "home": 2.0, "draw": 3.0, "away": 4.0 },
  "sportmonks_probs": { "home": 0.6, "draw": 0.2, "away": 0.2 },
  "features": { "home": 0.5, "draw": 0.3, "away": 0.2 }
}
```

**Response:**
```json
{
  "probabilities": { "home": 0.65, "draw": 0.20, "away": 0.15 },
  "confidence": 0.78,
  "weights": { "alpha": 0.6, "beta": 0.4, "gamma": 0.0 },
  "temperature": 1.0,
  "sources_active": ["sportradar", "sportmonks", "community-elo"],
  "brier_ema": 0.23,
  "logloss_ema": 1.12,
  "data_last_refresh": "2024-01-01T12:00:00.000Z",
  "citations": [
    { "url": "https://api.sportradar.com/...", "source_id": "sportradar", "timestamp": "2024-01-01T12:00:00.000Z" }
  ]
}
```

#### `POST /api/v1/learn`
Update the system with actual outcomes for learning.

```json
{
  "modelProbs": { "home": 0.6, "draw": 0.2, "away": 0.2 },
  "oddsProbs": { "home": 0.5, "draw": 0.3, "away": 0.2 },
  "actualOutcome": "H"
}
```

### **Monitoring Endpoints**

#### `GET /api/v1/status`
Get real-time system status.

#### `GET /api/v1/metrics`
Get detailed performance metrics.

#### `POST /api/v1/force-update`
Force immediate data update from all sources.

## 🧮 **MATHEMATICAL MODEL**

### **Ensemble Method**
The system uses geometric blending in log space for stability:

```
p*_k ∝ s_k^α · q̄_k^β · r_k^γ
```

Where:
- `s_k` = model prediction probabilities
- `q̄_k` = odds-implied probabilities (de-vigged)
- `r_k` = community-derived features
- `α, β, γ` = adaptive weights (sum to 1)

### **Weight Learning**
Uses projected gradient descent on the probability simplex:

```
(α,β,γ) ← Π_Δ[(α,β,γ) − η∇_w ℒ]
```

Where `ℒ = −log p_y` (negative log likelihood of actual outcome).

### **Quality Scoring**
Weekly quality score for each source:

```
Q_i = 0.4·Acc_i + 0.2·Lat_i + 0.2·Avail_i + 0.2·Fresh_i
```

## ⚡ **PERFORMANCE OPTIMIZATIONS**

### **Hardware-Specific Tuning**
- **8-thread parallel processing** for all computations
- **Incremental builds** with intelligent caching
- **Memory optimization** (2GB limit for Node.js)
- **Fast development** with watch mode and hot reloading

### **Learning Optimizations**
- **Adaptive learning rates** based on performance trends
- **Momentum-based gradients** for stability
- **Temperature scaling** for calibration
- **Hyperparameter sweeps** when performance plateaus

### **Data Optimizations**
- **Parallel data fetching** from multiple sources
- **Intelligent caching** with checksum validation
- **Quality-based source selection**
- **Real-time freshness monitoring**

## 🔧 **CONFIGURATION**

### **Environment Variables**
```bash
# Data Source API Keys (optional)
OPTA_API_KEY=your_opta_key
SPORTRADAR_API_KEY=your_sportradar_key
API_SPORTS_KEY=your_api_sports_key
SPORTMONKS_API_KEY=your_sportmonks_key
SPORTSDATAIO_API_KEY=your_sportsdataio_key

# System Configuration
NODE_ENV=production
LOG_LEVEL=info
PORT=3000
```

### **Temporal Configuration**
```typescript
{
  oddsRefreshInterval: 10,        // minutes
  fixturesRefreshInterval: 30,    // minutes
  injuriesRefreshInterval: 30,    // minutes
  newsRefreshInterval: 60,        // minutes
  communityRefreshInterval: 45,   // minutes
  weightUpdateInterval: 15,       // minutes
  qualityRankingInterval: 60,     // minutes
  evaluationInterval: 1440        // minutes (24 hours)
}
```

## 📈 **MONITORING & METRICS**

### **Real-Time Metrics**
- **Brier Score**: Probability calibration quality
- **Log Loss**: Prediction accuracy
- **Confidence**: Weighted combination of accuracy, calibration, sharpness
- **Data Freshness**: How recent the data is
- **Source Quality**: Performance of each data source

### **Learning Metrics**
- **Weight Stability**: How much weights are changing
- **Learning Rate**: Current adaptive learning rate
- **Temperature**: Calibration parameter
- **History Size**: Number of predictions in learning set

### **System Health**
- **Component Status**: Which systems are running
- **Data Points**: Total data points collected
- **Active Sources**: Currently active data sources
- **Uptime**: System uptime in milliseconds

## 🎯 **KEY FEATURES**

### **1. Continuous Learning**
- **Automatic weight updates** every 15 minutes
- **Quality ranking updates** every hour
- **Self-evaluation** every 24 hours
- **Hyperparameter optimization** when needed

### **2. Multi-Source Intelligence**
- **Verified APIs**: Opta, Sportradar, API-SPORTS, SportMonks
- **Community Data**: Google Sheets, crowd wisdom
- **Quality Ranking**: Automatic source selection
- **Fault Tolerance**: Graceful handling of source failures

### **3. Advanced Mathematics**
- **Geometric blending** in log space
- **Projected gradient descent** on simplex
- **Temperature scaling** for calibration
- **Momentum-based optimization**

### **4. Self-Monitoring**
- **Performance tracking** with EMA metrics
- **Automatic recommendations** for improvement
- **Hyperparameter sweeps** when plateaued
- **Comprehensive logging** and metrics

## 🚨 **SAFETY & POLICY**

- **No betting advice**: Educational purposes only
- **Deterministic results**: Reproducible with same inputs
- **Licensed data**: All external data properly licensed
- **Privacy compliant**: No personal data collection

## 🔍 **TROUBLESHOOTING**

### **Common Issues**

1. **API Keys Missing**: System works with mock data if no API keys provided
2. **Memory Issues**: Adjust `--max-old-space-size` in package.json
3. **Slow Performance**: Check if all 8 cores are being utilized
4. **Data Not Updating**: Check network connectivity and API key validity

### **Debug Commands**

```bash
# Check system status
curl http://localhost:3000/api/v1/status

# Force data update
curl -X POST http://localhost:3000/api/v1/force-update

# Get detailed metrics
curl http://localhost:3000/api/v1/metrics
```

## 📚 **DEVELOPMENT**

### **Project Structure**
```
src/
├── data/           # Data ingestion and caching
├── learning/       # Adaptive weight learning
├── scheduler/      # Temporal loops and quality ranking
├── engine/         # Main orchestrator
├── routes/         # API endpoints
├── services/       # Business logic
├── math/           # Mathematical functions
└── validation/     # Input validation
```

### **Adding New Data Sources**
1. Add source configuration in `DataIngestionEngine`
2. Implement data parser for the source
3. Add quality metrics calculation
4. Update temporal scheduler if needed

### **Custom Learning Algorithms**
1. Extend `AdaptiveWeightLearner` class
2. Implement custom gradient calculation
3. Add new optimization methods
4. Update ensemble blending logic

---

## ✅ **ACTIVATION COMPLETE**

**"Self-updating, data-validated, weight-adapting predictor online — continuous optimization enabled."**

The system is now running as a fully autonomous statistical engine, continuously learning and improving its predictions through real-world data and advanced machine learning techniques.

**🎯 Ready for production use with maximum predictive accuracy!**

