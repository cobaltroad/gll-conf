import React from 'react'
import Questions from './questions/questions-component'
import AskQuestion from './questions/ask-question-component'

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
        <AskQuestion />
        <Questions />
      </div>
    );
  }
}
