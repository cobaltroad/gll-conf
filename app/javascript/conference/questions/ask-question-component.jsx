import React from 'react'
import HttpClient from '../http-client/http-client'

export default class AskQuestion extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      question_text: ''
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
    this.httpClient.addQuestion({ body: this.state.question_text })
                   .then((question) => { this.liftStateUp(question.id); });
  }

  liftStateUp(questionId) {
    this.props.onQuestionAdded(questionId);
  }

  render() {
    return(
      <form onSubmit={this.onSubmit}>
        <input name="question_text" placeholder="What is your question?" onChange={this.onChange} />
        <button type="submit">Add Question</button>
      </form>
    );
  }
}
