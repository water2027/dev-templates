import { fileURLToPath } from 'node:url'
import { defineConfig } from 'vitest/config'

export default defineConfig({
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url)),
    },
  },
  test: {
    environment: 'node',
    globals: true,
    clearMocks: true,
    restoreMocks: true,
    include: [
      'src/**/*.{test,spec}.ts',
      'test/**/*.{test,spec}.ts',
      'tests/**/*.{test,spec}.ts',
    ],
    exclude: [
      'node_modules',
      'dist',
      'build',
      'coverage',
    ],
    coverage: {
      provider: 'v8',
      reporter: ['text', 'json', 'html'],
      reportsDirectory: './coverage',
      exclude: [
        '**/*.d.ts',
        '**/*.{test,spec}.ts',
        '**/*.config.*',
        'dist/**',
        'build/**',
        'coverage/**',
        'test/**',
        'tests/**',
      ],
    },
  },
})
