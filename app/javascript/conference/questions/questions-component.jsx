import React from 'react'
import HttpClient from '../http-client/http-client'

import Question from './question-component'

export default class Questions extends React.Component {
  constructor() {
    super();
    this.state = {
      questions: []
    }

    this.httpClient = HttpClient.instance;
    this.httpClient.questions().then((questions) => {
      this.setState({ questions: questions });
    });
  }

  render() {
    var questions = this.state.questions.map(obj => (
      <li key={obj.id}>
        <Question id={obj.id}
                  body={obj.body}
                  submitted_by={obj.submitted_by}
                  yes_vote_total={obj.yes_vote_total}
                  current_user_yes_vote={obj.current_user_yes_vote}
        />
      </li>
    ));
    return(
      <div>
        <h4>Questions</h4>
        <ul>{ questions }</ul>
      </div>
    );
  }
}
