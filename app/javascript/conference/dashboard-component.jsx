import React from 'react'
import HttpClient from './http-client/http-client'
import Questions from './questions/questions-component'
import AskQuestion from './questions/ask-question-component'

export default class Dashboard extends React.Component {
  constructor() {
    super();
    this.currentUser = JSON.parse(localStorage.getItem('currentUser'));

    this.state = { questions: [] }

    this.httpClient = HttpClient.instance;
    this.httpClient.questions().then((questions) => {
      this.setState({ questions: questions });
    });
  }

  updateState = (questionId) => {
    this.httpClient.questions().then((questions) => {
      this.setState({ questions: questions });
    });
  }

  render() {
    return(
      <div>
        <h1>GLL Conference</h1>
        <h3>Email: {this.currentUser.email}</h3>
        <h3>Role: {this.currentUser.role}</h3>
        <hr />
        <AskQuestion onQuestionAdded={this.updateState} />
        <Questions questions={this.state.questions} />
      </div>
    );
  }
}
