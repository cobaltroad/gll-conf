import axios from 'axios'

export default class HttpClient {
  static instance = this.instance == null ? new HttpClient() : this.instance;

  constructor() {
    this.state = {
      token: document.getElementsByName('csrf-token')[0]['content'],
    }
    this.axiosInstance = axios.create({
      headers: {
        'X-CSRF-Token': this.state['token'],
        'Accept':       'application/json'
      }
    });
  }

  authenticate(obj) {
    return this.axiosInstance.post('/api/authentication', obj)
      .then((success) => {
        localStorage.setItem('currentUser', JSON.stringify(success.data));
      })
  }

  addUser(obj) {
    return this.axiosInstance.post('/api/authentication/add_user', obj)
      .then((success) => success.data)
  }

  questions() {
    return this.axiosInstance.get('/api/questions', this.authorizationHeader())
      .then(success => success.data)
      .catch((error) => {
        console.log("ERROR", error.response);
      });
  }

  addQuestion(obj) {
    return this.axiosInstance.post('/api/questions', obj, this.authorizationHeader())
      .then(success => success.data.question)
      .catch((error) => {
        console.log("ERROR", error.response);
      });
  }

  voteQuestion(obj) {
    var id = obj.id;
    return this.axiosInstance.post('/api/questions/' + id + '/vote', obj, this.authorizationHeader())
      .then(success => success.data)
      .catch((error) => {
        console.log("ERROR", error.response);
      })
  }

  updateQuestion(obj) {
    var id = obj.id;
    return this.axiosInstance.put('/api/questions/' + id, obj, this.authorizationHeader())
      .then(success => success.data)
      .catch((error) => {
        console.log("ERROR", error.response);
      })
  }

  isLoggedIn() {
    let currentUser = localStorage.getItem('currentUser');
    return !!currentUser;
  }

  authorizationHeader() {
    let currentUser = JSON.parse(localStorage.getItem('currentUser'));
    return {
      headers: {
        'Authorization': "Bearer " + currentUser.id
      }
    }
  }
}
