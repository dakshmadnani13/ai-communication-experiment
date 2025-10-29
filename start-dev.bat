@echo off
REM Game Outcome Predictor - Development Startup Script
REM Optimized for 8-core laptop with 16GB RAM

echo 🚀 Starting Game Outcome Predictor...
echo Hardware: 8-core CPU, 16GB RAM, SSD
echo.

REM Check if node_modules exists
if not exist "node_modules" (
    echo 📦 Installing dependencies...
    npm install
)

if not exist "frontend\node_modules" (
    echo 📦 Installing frontend dependencies...
    cd frontend
    npm install
    cd ..
)

REM Start backend in background
echo 🔧 Starting backend API (optimized for 8 cores)...
start "Backend API" cmd /k "npm run dev:fast"

REM Wait a moment for backend to start
timeout /t 3 /nobreak >nul

REM Start frontend
echo 🎨 Starting frontend (Next.js with Turbo)...
cd frontend
start "Frontend" cmd /k "npm run dev:fast"
cd ..

REM Wait for both to start
timeout /t 5 /nobreak >nul

echo.
echo ✅ Application started successfully!
echo.
echo 🌐 Frontend: http://localhost:3001
echo 🔧 Backend API: http://localhost:3000
echo 📊 Health Check: http://localhost:3000/health
echo.
echo Press any key to stop this launcher (services will continue running)
pause >nul

