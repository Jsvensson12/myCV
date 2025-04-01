const request = require('supertest')
const app = require('./server')

describe('GET /', () => {
    it('Response status 200 with expected text', async () => {
        const res = await request(app).get('/')
        expect(res.statusCode).toBe(200)
        expect(res.text).toMatch/('/Jesper Svensson')
    })
})