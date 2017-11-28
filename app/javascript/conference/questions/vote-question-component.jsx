import React from 'react'

export default class VoteQuestion extends React.Component {
  constructor(props) {
    super(props);
    this.state = { ...props };
  }

  render() {
    const {
      yes_vote_total,
      current_user_yes_vote
    } = this.state;
    return(
      <div>
        Vote Total: {yes_vote_total}
        Your vote: {current_user_yes_vote}
        <button>Vote Yes</button>
        <button>Vote No</button>
      </div>
    );
  }
}
