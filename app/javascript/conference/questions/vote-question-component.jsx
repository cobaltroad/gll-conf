import React from 'react'
import styles from './vote-question.css.js'

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

    var showYesButton = current_user_yes_vote === null ? true : !current_user_yes_vote;
    var showNoButton  = current_user_yes_vote === null ? true :  current_user_yes_vote;

    var yesButton = showYesButton ? (
                      <button>Vote Yes</button>
                    ) : (null);
    var noButton  = showNoButton ? (
                      <button>Vote No</button>
                    ) : (null);

    return(
      <span style={styles.span}>
        {yesButton}
        <input style={styles.input} value={yes_vote_total} disabled />
        {noButton}
      </span>
    );
  }
}
