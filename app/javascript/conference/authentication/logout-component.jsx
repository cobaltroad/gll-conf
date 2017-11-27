import React from 'react'
import {
  BrowserRouter as Router,
  Redirect
}from 'react-router-dom'

export default class LogoutComponent extends React.Component {
  constructor() {
    super();
    this.state = {
      loggedIn: true
    };
  }

  onSubmit = (e) => {
    e.preventDefault();
    setTimeout(() => {
      localStorage.removeItem('currentUser');
      this.setState({ loggedIn: false });
    }, 100);
  }

  render() {
    if (this.state['loggedIn']) {
      return(
        <form onSubmit={this.onSubmit}>
          <button type="submit">Log Out</button>
        </form>
      );
    } else {
      console.log("LOGGING OUT");
      return(
        <Redirect to={{ pathname: '/authentication' }}/>
      );
    }
  }
}
