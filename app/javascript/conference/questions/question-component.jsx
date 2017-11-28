import React from 'react'
import VoteQuestion from './vote-question-component'

export default class Question extends React.Component {
  constructor(props) {
    super(props);
    this.state = { ...props };
  }

  render() {
    const {
      id,
      body,
      submitted_by,
      yes_vote_total,
      current_user_yes_vote
    } = this.state;
    return(
      <div>
        <VoteQuestion id={id}
                      yes_vote_total={yes_vote_total}
                      current_user_yes_vote={current_user_yes_vote}
        />
        <span>
          <strong>"{body}"</strong> - <em>{submitted_by}</em>
        </span>
      </div>
    );
  }
}
