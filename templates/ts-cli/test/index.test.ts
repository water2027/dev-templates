describe('package entry', () => {
  it('loads the public module', async () => {
    await expect(import('../src/index.js')).resolves.toBeDefined()
  })
})
