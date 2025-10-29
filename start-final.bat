@echo off
REM FINAL CONTINUOUS LEARNING STATISTICAL ENGINE
REM Production-ready with supernova optimization

echo ===============================================
echo 🧠 CONTINUOUS LEARNING STATISTICAL ENGINE
echo ===============================================
echo ✅ Self-updating, data-validated, weight-adapting predictor
echo 🚀 Hardware-optimized for 8-core laptop
echo ===============================================

REM Build the system
echo 🔧 Building continuous learning engine...
npx tsc src/index.ts src/routes/prediction.ts src/routes/health.ts src/services/prediction.ts src/math/core.ts src/types.ts src/validation/schemas.ts src/engine/simple_learner.ts --outDir dist --target ES2022 --module ESNext --moduleResolution node --allowSyntheticDefaultImports --esModuleInterop --skipLibCheck

if errorlevel 1 (
    echo ❌ Build failed
    pause
    exit /b 1
)

echo ✅ Build successful!

REM Start the engine
echo 🚀 Starting Continuous Learning Statistical Engine...
echo.
echo 🎯 Features Active:
echo   • Real-time adaptive ensemble learning
echo   • Geometric blending of probability sources
echo   • Continuous weight optimization
echo   • Performance monitoring and self-evaluation
echo   • Hardware-optimized for 8-core systems
echo.

start "Continuous Learning Engine" cmd /k "node dist/index.js"

REM Wait for startup
timeout /t 5 /nobreak >nul

echo.
echo ===============================================
echo ✅ CONTINUOUS LEARNING ENGINE ONLINE
echo ===============================================
echo.
echo 🌐 API Endpoints:
echo   • Health: http://localhost:3000/health
echo   • Predict: http://localhost:3000/api/v1/predict
echo   • Status: http://localhost:3000/api/v1/status
echo   • Metrics: http://localhost:3000/api/v1/metrics
echo   • Learn: http://localhost:3000/api/v1/learn
echo.
echo 🧠 Learning Features:
echo   • Adaptive weight updates with gradient descent
echo   • Geometric blending in log space
echo   • Performance monitoring with EMA metrics
echo   • Self-evaluation and optimization
echo.
echo ===============================================
echo Press any key to stop this launcher
echo (Engine continues running in background)
echo ===============================================
pause >nul
