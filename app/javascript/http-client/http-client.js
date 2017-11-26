import axios from 'axios'

export default class HttpClient {
  static instance = this.instance == null ? new HttpClient() : this.instance;

  constructor() {
    this.state = {
      token: document.getElementsByName('csrf-token')[0]['content']
    }
    this.axiosInstance = axios.create({
      baseURL: 'http://localhost:3000',
      headers: { 'X-CSRF-Token': this.state['token'] }
    });
  }

  authenticate(obj) {
    this.axiosInstance.post('/authentication', obj)
      .then((result) => {
        console.log("RESULT", result);
      })
      .catch((error) => {
        console.log("ERROR", error);
      });
  }
}
