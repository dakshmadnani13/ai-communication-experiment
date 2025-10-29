// Simple startup script for testing
const { spawn } = require('child_process');
const path = require('path');

console.log('🚀 Starting Game Outcome Predictor...');
console.log('Hardware: 8-core CPU, 16GB RAM, SSD');
console.log('');

// Start backend
console.log('🔧 Starting backend API...');
const backend = spawn('node', ['dist/index.js'], {
  stdio: 'inherit',
  env: { ...process.env, NODE_ENV: 'development' }
});

backend.on('error', (err) => {
  console.error('Backend error:', err);
});

backend.on('exit', (code) => {
  console.log(`Backend exited with code ${code}`);
});

// Wait a moment then start frontend
setTimeout(() => {
  console.log('🎨 Starting frontend...');
  const frontend = spawn('npm', ['run', 'dev'], {
    stdio: 'inherit',
    cwd: path.join(__dirname, 'frontend'),
    shell: true
  });

  frontend.on('error', (err) => {
    console.error('Frontend error:', err);
  });

  frontend.on('exit', (code) => {
    console.log(`Frontend exited with code ${code}`);
  });
}, 3000);

console.log('');
console.log('✅ Application starting...');
console.log('🌐 Frontend: http://localhost:3001');
console.log('🔧 Backend API: http://localhost:3000');
console.log('📊 Health Check: http://localhost:3000/health');
console.log('');
console.log('Press Ctrl+C to stop all services');

