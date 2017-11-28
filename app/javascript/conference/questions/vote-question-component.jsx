import React from 'react'
import styles from './vote-question.css.js'
import HttpClient from '../http-client/http-client'

export default class VoteQuestion extends React.Component {
  constructor(props) {
    super(props);
    this.state = { ...props };

    this.httpClient = HttpClient.instance;
  }

  voteYes = (e) => {
    e.preventDefault();
    const voteObj = {
      id: this.state.id,
      yes_vote: true
    }
    this.httpClient.voteQuestion(voteObj).then((question) => {
      this.setState(question);
    });
  }

  voteNo = (e) => {
    e.preventDefault();
    const voteObj = {
      id: this.state.id,
      yes_vote: false
    }
    this.httpClient.voteQuestion(voteObj).then((question) => {
      this.setState(question);
    });
  }

  render() {
    const {
      yes_vote_total,
      current_user_yes_vote
    } = this.state;

    var disableYes = current_user_yes_vote === null ? false :  current_user_yes_vote;
    var disableNo  = current_user_yes_vote === null ? false : !current_user_yes_vote;

    return(
      <span style={styles.span}>
        <button disabled={disableYes} onClick={this.voteYes}>Vote Yes</button>
        <input style={styles.input} value={yes_vote_total} disabled />
        <button disabled={disableNo} onClick={this.voteNo}>Vote No</button>
      </span>
    );
  }
}
