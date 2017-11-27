import React from 'react'
import Questions from './questions/questions-component'

export default class Dashboard extends React.Component {
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
        <Questions currentUserId={this.currentUser.id} />
      </div>
    );
  }
}
