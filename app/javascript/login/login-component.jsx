import React from 'react'
import axios from 'axios'

export default class LoginComponent extends React.Component {
  constructor() {
    super();
    this.state = {
      email: '',
      password: ''
    };

    let token = document.getElementsByName('csrf-token')[0]['content'];
    this.httpClient = axios.create({
      baseURL: 'http://localhost:3000',
      headers: { 'X-CSRF-Token': token }
    });
  }

  onChange = (e) => {
    const state = this.state;
    state[e.target.name] = e.target.value;
    this.setState(state);
  }

  onSubmit = (e) => {
    e.preventDefault();
    console.log(this.state);
    this.httpClient.post('/authentication', this.state)
      .then((result) => {
        console.log("RESULT", result);
      })
      .catch((error) => {
        console.log("ERROR", error);
      });
  }

  render() {
    return(
      <form onSubmit={this.onSubmit}>
        <input name="email" placeholder="Email Address" onChange={this.onChange} />
        <input type="password" name="password" placeholder="Password" onChange={this.onChange} />
        <button type="Submit">Log In</button>
      </form>
    );
  }
}
