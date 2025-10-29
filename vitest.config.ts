import { defineConfig } from 'vitest/config'

export default defineConfig({
  test: {
    // Optimize for 8-core laptop
    threads: 8,
    maxThreads: 8,
    minThreads: 4,
    
    // Memory optimization
    pool: 'threads',
    poolOptions: {
      threads: {
        singleThread: false,
        minThreads: 4,
        maxThreads: 8,
      }
    },
    
    // Test configuration
    globals: true,
    environment: 'node',
    passWithNoTests: true,
    
    // Coverage optimization
    coverage: {
      provider: 'v8',
      reporter: ['text', 'json', 'html'],
      reportsDirectory: './coverage',
      exclude: [
        'node_modules/',
        'dist/',
        '**/*.d.ts',
        '**/*.config.*',
        '**/coverage/**',
        '**/test/**',
        '**/tests/**',
        '**/*.test.*',
        '**/*.spec.*'
      ],
      thresholds: {
        global: {
          branches: 80,
          functions: 80,
          lines: 80,
          statements: 80
        }
      }
    },
    
    // Performance optimizations
    testTimeout: 10000,
    hookTimeout: 10000,
    teardownTimeout: 10000,
    
    // File watching optimizations
    watch: false,
    forceRerunTriggers: ['**/package.json', '**/vitest.config.*', '**/vite.config.*'],
    
    // Reporter configuration
    reporter: ['verbose', 'json', 'html'],
    outputFile: {
      json: './test-results/results.json',
      html: './test-results/index.html'
    }
  },
  
  // Build optimizations
  esbuild: {
    target: 'node18',
    format: 'esm'
  },
  
  // Resolve optimizations
  resolve: {
    alias: {
      '@': './src',
      '@frontend': './frontend'
    }
  }
})