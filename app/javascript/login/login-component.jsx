import React from 'react'
import HttpClient from '../http-client/http-client'

export default class LoginComponent extends React.Component {
  constructor() {
    super();
    this.state = {
      email: '',
      password: ''
    };

    this.httpClient = HttpClient.instance;
  }

  onChange = (e) => {
    const state = this.state;
    state[e.target.name] = e.target.value;
    this.setState(state);
  }

  onSubmit = (e) => {
    e.preventDefault();
    this.httpClient.authenticate(this.state);
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
