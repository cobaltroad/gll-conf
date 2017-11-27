import React from 'react'
import {
  BrowserRouter as Router,
  Redirect
} from 'react-router-dom';

export default class DashboardComponent extends React.Component {
  constructor() {
    super();
    this.state = {
      loggedIn: true
    };
  }

  signout = () => {
    setTimeout(() => {
      localStorage.removeItem('currentUser');
      this.setState({ loggedIn: false });
    }, 100);
  }

  render() {
    if (this.state['loggedIn']) {
      let currentUser = localStorage.getItem('currentUser');
      console.log("CURRENT USER", currentUser);
      return(
        <div>
          <h1>Dashboard</h1>

          <button onClick={this.signout}>Sign Out</button>
        </div>
      );
    } else {
      console.log("LOGGING OUT");
      return(
        <Redirect to={{ pathname: '/authentication' }}/>
      );
    }
  }
}
