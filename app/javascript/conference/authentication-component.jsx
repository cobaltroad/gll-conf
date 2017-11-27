import React from 'react'
import {
  BrowserRouter as Router,
  Redirect
} from 'react-router-dom'
import HttpClient from '../http-client/http-client'

export default class AuthenticationComponent extends React.Component {
  constructor() {
    super();
    this.state = {
      email: '',
      password: '',
      loggedIn: false
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
    this.httpClient.authenticate(this.state).then(() => {
      this.setState({ loggedIn: this.httpClient.isLoggedIn() });
    })
  }

  render() {
    if (this.state['loggedIn']) {
      console.log("REDIRECTING");
      return(
        <Redirect to={{ pathname: '/' }}/>
      );
    } else {
      return(
        <form onSubmit={this.onSubmit}>
          <input name="email" placeholder="Email Address" onChange={this.onChange} />
          <input type="password" name="password" placeholder="Password" onChange={this.onChange} />
          <button type="Submit">Log In</button>
        </form>
      );
    }
  }
}
