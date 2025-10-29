# 🏈 Game Outcome Predictor

A sophisticated football match outcome prediction system using mathematical ensembling with multiple probability sources.

## 🚀 Features

- **Mathematical Ensembling**: Combines multiple probability sources using geometric blending
- **Multiple Data Sources**: Supports odds, Sportmonks probabilities, and custom features
- **Real-time Predictions**: Fast API with optimized performance
- **Modern UI**: Beautiful, responsive Next.js frontend
- **Hardware Optimized**: Tuned for 8-core laptops with 16GB RAM

## 🏗️ Architecture

### Backend (Node.js + TypeScript)
- **Fastify** web framework for high performance
- **Zod** for request validation
- **Mathematical core** with probability calculations
- **RESTful API** with comprehensive error handling

### Frontend (Next.js + React)
- **Next.js 14** with Turbo mode
- **Tailwind CSS** for styling
- **TypeScript** for type safety
- **Responsive design** for all devices

## 🛠️ Quick Start

### Prerequisites
- Node.js 18+
- npm or pnpm
- 8-core CPU (optimized for)
- 16GB RAM (recommended)

### Installation

1. **Clone and install dependencies:**
```bash
git clone <repository-url>
cd game-outcome-predictor
npm install
cd frontend && npm install && cd ..
```

2. **Start development servers:**
```bash
# Windows
start-dev.bat

# Linux/Mac
./start-dev.sh

# Or manually:
npm run dev:fast          # Backend (port 3000)
cd frontend && npm run dev:fast  # Frontend (port 3001)
```

3. **Access the application:**
- Frontend: http://localhost:3001
- Backend API: http://localhost:3000
- Health Check: http://localhost:3000/health

## 📊 API Usage

### Prediction Endpoint
```bash
POST /api/v1/predict
Content-Type: application/json

{
  "odds": {
    "home": 2.0,
    "draw": 3.0,
    "away": 4.0
  },
  "sportmonks_probs": {
    "home": 0.6,
    "draw": 0.2,
    "away": 0.2
  },
  "ensemble_weights": {
    "alpha": 0.6,
    "beta": 0.4,
    "gamma": 0.0
  }
}
```

### Response
```json
{
  "probabilities": {
    "home": 0.65,
    "draw": 0.20,
    "away": 0.15
  },
  "confidence": 0.78,
  "diagnostics": {
    "entropy": 0.89,
    "max_probability": 0.65,
    "ensemble_weights": {
      "alpha": 0.6,
      "beta": 0.4,
      "gamma": 0.0
    }
  },
  "metadata": {
    "timestamp": "2024-01-01T12:00:00.000Z",
    "version": "1.0.0"
  }
}
```

## 🧮 Mathematical Model

### Probability Sources
1. **Odds-derived probabilities**: Converted from decimal odds with de-vigging
2. **Sportmonks probabilities**: Historical data-based predictions
3. **Feature-based probabilities**: Custom model outputs

### Ensemble Method
- **Geometric blending** in log space for stability
- **Weighted combination** of available sources
- **Simplex normalization** to ensure valid probabilities
- **Entropy-based confidence** scoring

### Key Formulas
- **Odds to probabilities**: `p = 1/odds` (with de-vigging)
- **Geometric mean**: `log(p_ensemble) = Σ(w_i * log(p_i))`
- **Confidence**: `1 - (entropy / log(3))`

## ⚡ Performance Optimizations

### Hardware-Specific Tuning
- **8-thread parallel compilation** for TypeScript
- **Incremental builds** with caching
- **Memory optimization** (2GB limit)
- **Fast development** with watch mode
- **Parallel testing** with 8 threads

### Build Optimizations
- **Turbo mode** for Next.js
- **Webpack parallelism** (8 cores)
- **Optimized chunk splitting**
- **Image optimization** (WebP/AVIF)
- **Package import optimization**

## 🐳 Docker Deployment

### Development
```bash
docker-compose up
```

### Production
```bash
docker-compose -f docker-compose.prod.yml up
```

## 📁 Project Structure

```
├── src/                    # Backend source
│   ├── index.ts           # Main server
│   ├── routes/            # API routes
│   ├── services/          # Business logic
│   ├── math/              # Mathematical functions
│   ├── validation/        # Zod schemas
│   └── types.ts           # Type definitions
├── frontend/              # Next.js frontend
│   ├── app/               # App router
│   ├── components/        # React components
│   └── types/             # Frontend types
├── dist/                  # Compiled backend
├── docker-compose.yml     # Docker configuration
└── README.md             # This file
```

## 🧪 Testing

```bash
# Run all tests
npm test

# Run tests with coverage
npm run test:coverage

# Watch mode
npm run test:watch
```

## 🔧 Development Scripts

```bash
# Backend
npm run dev:fast          # Fast development
npm run build:fast        # Fast build
npm run start:prod        # Production start

# Frontend
cd frontend
npm run dev:fast          # Turbo development
npm run build:analyze     # Build with analysis
```

## 📈 Performance Metrics

- **Build time**: ~30s (8-core optimization)
- **API response**: <100ms average
- **Memory usage**: <2GB total
- **Concurrent users**: 1000+ (estimated)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests
5. Submit a pull request

## 📄 License

MIT License - see LICENSE file for details

## 🆘 Support

For issues and questions:
- Create an issue on GitHub
- Check the API documentation
- Review the mathematical model documentation

---

**Built with ❤️ and optimized for your hardware!**