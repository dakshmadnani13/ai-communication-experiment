@echo off
REM Continuous Learning Statistical Engine - Startup Script
REM Optimized for 8-core laptop with 16GB RAM

echo ===============================================
echo 🚀 CONTINUOUS LEARNING STATISTICAL ENGINE
echo ===============================================
echo Hardware: 8-core CPU, 16GB RAM, SSD
echo Purpose: Self-updating, data-validated, weight-adapting predictor
echo ===============================================

REM Check if node_modules exists
if not exist "node_modules" (
    echo 📦 Installing dependencies...
    npm install
    if errorlevel 1 (
        echo ❌ Failed to install dependencies
        pause
        exit /b 1
    )
)

if not exist "frontend\node_modules" (
    echo 📦 Installing frontend dependencies...
    cd frontend
    npm install
    if errorlevel 1 (
        echo ❌ Failed to install frontend dependencies
        pause
        exit /b 1
    )
    cd ..
)

REM Build the backend
echo 🔧 Building continuous learning engine...
npm run build:fast
if errorlevel 1 (
    echo ❌ Build failed
    pause
    exit /b 1
)

REM Start the continuous learning engine
echo 🧠 Starting Continuous Learning Statistical Engine...
echo.
echo Features:
echo   • Real-time data ingestion from verified sources
echo   • Adaptive ensemble weight learning with gradient descent
echo   • Quality-based source ranking and selection
echo   • Continuous performance monitoring and optimization
echo   • Self-evaluation and automatic hyperparameter tuning
echo   • Community data integration (Google Sheets, etc.)
echo.

start "Continuous Learning Engine" cmd /k "npm run start:prod"

REM Wait for backend to start
timeout /t 5 /nobreak >nul

REM Start frontend
echo 🎨 Starting frontend interface...
cd frontend
start "Frontend Interface" cmd /k "npm run dev:fast"
cd ..

REM Wait for both to start
timeout /t 8 /nobreak >nul

echo.
echo ===============================================
echo ✅ CONTINUOUS LEARNING ENGINE ONLINE
echo ===============================================
echo.
echo 🌐 Frontend Interface: http://localhost:3001
echo 🔧 Backend API: http://localhost:3000
echo 📊 Health Check: http://localhost:3000/health
echo 📈 System Status: http://localhost:3000/api/v1/status
echo 🔍 Detailed Metrics: http://localhost:3000/api/v1/metrics
echo.
echo 🎯 API Endpoints:
echo   • POST /api/v1/predict - Get predictions
echo   • POST /api/v1/learn - Update with actual outcomes
echo   • GET /api/v1/status - System status
echo   • GET /api/v1/metrics - Detailed metrics
echo   • POST /api/v1/force-update - Force data update
echo.
echo 🧠 Learning Features:
echo   • Automatic weight adaptation every 15 minutes
echo   • Quality ranking updates every hour
echo   • Self-evaluation every 24 hours
echo   • Hyperparameter optimization when needed
echo   • Real-time data ingestion from multiple sources
echo.
echo ===============================================
echo Press any key to stop this launcher
echo (Services will continue running in background)
echo ===============================================
pause >nul

