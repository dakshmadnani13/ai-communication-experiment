#!/bin/bash

# Game Outcome Predictor - Development Startup Script
# Optimized for 8-core laptop with 16GB RAM

echo "🚀 Starting Game Outcome Predictor..."
echo "Hardware: 8-core CPU, 16GB RAM, SSD"
echo ""

# Check if node_modules exists
if [ ! -d "node_modules" ]; then
    echo "📦 Installing dependencies..."
    npm install
fi

if [ ! -d "frontend/node_modules" ]; then
    echo "📦 Installing frontend dependencies..."
    cd frontend && npm install && cd ..
fi

# Start backend in background
echo "🔧 Starting backend API (optimized for 8 cores)..."
npm run dev:fast &
BACKEND_PID=$!

# Wait a moment for backend to start
sleep 3

# Start frontend
echo "🎨 Starting frontend (Next.js with Turbo)..."
cd frontend
npm run dev:fast &
FRONTEND_PID=$!

# Wait for both to start
sleep 5

echo ""
echo "✅ Application started successfully!"
echo ""
echo "🌐 Frontend: http://localhost:3001"
echo "🔧 Backend API: http://localhost:3000"
echo "📊 Health Check: http://localhost:3000/health"
echo ""
echo "Press Ctrl+C to stop all services"

# Function to cleanup on exit
cleanup() {
    echo ""
    echo "🛑 Stopping services..."
    kill $BACKEND_PID 2>/dev/null
    kill $FRONTEND_PID 2>/dev/null
    echo "✅ All services stopped"
    exit 0
}

# Trap Ctrl+C
trap cleanup SIGINT

# Wait for user to stop
wait

