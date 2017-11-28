import React from 'react'
import SelectQuestion from './select-question-component'
import VoteQuestion from './vote-question-component'

export default class Question extends React.Component {
  constructor(props) {
    super(props);
    this.state = { ...props };
  }

  liftStateUp = () => {
    this.props.onVoted();
  }

  render() {
    const {
      id,
      body,
      submitted_by,
      yes_vote_total,
      current_user_yes_vote,
      is_selected
    } = this.state;
    return(
      <div>
        <SelectQuestion id={id} is_selected={is_selected} />
        <VoteQuestion id={id}
                      yes_vote_total={yes_vote_total}
                      current_user_yes_vote={current_user_yes_vote}
                      onVoted={this.liftStateUp}
        />
        <span>
          <strong>"{body}"</strong> - <em>{submitted_by}</em>
        </span>
      </div>
    );
  }
}
