import React from 'react'
import Question from './question-component'

export default class Questions extends React.Component {
  constructor(props) {
    super(props);
  }

  liftStateUp = () => {
    this.props.onVoted();
  }

  render() {
    var sortedQuestions = this.props.questions.sort((a,b) => {
      return(b.yes_vote_total - a.yes_vote_total);
    });
    var questions = sortedQuestions.map(obj => (
      <li key={obj.id}>
        <Question id={obj.id}
                  body={obj.body}
                  submitted_by={obj.submitted_by}
                  yes_vote_total={obj.yes_vote_total}
                  current_user_yes_vote={obj.current_user_yes_vote}
                  onVoted={this.liftStateUp}
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
