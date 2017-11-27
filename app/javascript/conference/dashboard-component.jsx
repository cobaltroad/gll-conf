import React from 'react'

export default class DashboardComponent extends React.Component {
  constructor() {
    super();
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
  }

  render() {
    return(
      <div>
        <h1>GLL Conference</h1>
        <h3>Email: {this.currentUser.email}</h3>
        <h3>Role: {this.currentUser.role}</h3>
        <hr />
      </div>
    );
  }
}
