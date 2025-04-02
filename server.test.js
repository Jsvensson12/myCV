const request = require('supertest')
const app = require('./server')

describe('GET /', () => {
    it('Response status 200 with expected text', async () => {
        const res = await request(app).get('/')
        expect(res.statusCode).toBe(200)
        expect(res.text).toMatch(/Jesper Svensson/)
    })
})

describe('GET /info', () => {
    it('responds with JSON metadata', async () => {
      const res = await request(app).get('/info');
      expect(res.statusCode).toBe(200);
      expect(res.body).toHaveProperty('version');
      expect(res.body).toHaveProperty('commit');
      expect(res.body).toHaveProperty('nodeEnv');
      expect(res.body).toHaveProperty('timestamp');
    });
  });