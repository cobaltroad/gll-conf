import React from 'react'
import {
  BrowserRouter as Router,
  Redirect
} from 'react-router-dom'
import HttpClient from '../http-client/http-client'
import Registration from './registration-component'

export default class LoginComponent extends React.Component {
  constructor() {
    super();
    this.state = {
      email: '',
      password: '',
      loggedIn: false,
      loginError: null
    };

    this.httpClient = HttpClient.instance;
  }

  onChange = (e) => {
    const state = this.state;
    state[e.target.name] = e.target.value;
    state['loginError'] = null;
    this.setState(state);
  }

  onSubmit = (e) => {
    e.preventDefault();
    login(this.state);
  }

  onRegister = (state) => {
    login(state);
  }

  login(state) {
    this.httpClient.authenticate(state).then(() => {
      this.setState({ loggedIn: this.httpClient.isLoggedIn() });
    }).catch((error) => {
      this.setState({ loginError: error.response.data.message });
    });
  }

  render() {
    if (this.state['loggedIn']) {
      console.log("LOGGING IN");
      return(
        <Redirect to={{ pathname: '/' }}/>
      );
    } else {
      return(
        <div>
          <h1>GLL Conference</h1>
          <hr/>
          <h3>Log In</h3>
          <form onSubmit={this.onSubmit}>
            <input name="email" placeholder="Email Address" onChange={this.onChange} />
            <input type="password" name="password" placeholder="Password" onChange={this.onChange} />
            <button type="submit">Log In</button>
          </form>
          <div>{this.state['loginError']}</div>
          <hr/>
          <h3>Register</h3>
          <Registration onRegister={this.onRegister} />
        </div>
      );
    }
  }
}
