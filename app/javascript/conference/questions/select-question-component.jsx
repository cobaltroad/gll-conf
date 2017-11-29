import React from 'react'
import HttpClient from '../http-client/http-client'

export default class SelectQuestion extends React.Component {
  constructor(props) {
    super(props);
    this.state = { ...props }

    this.httpClient = HttpClient.instance;
    let currentUser = JSON.parse(localStorage.getItem('currentUser'));
    this.disabled = currentUser.role !== 'moderator';
  }

  toggleSelection = (e) => {
    const newValue = !this.state.is_selected;
    const updateObj = {
      id: this.state.id,
      is_selected: newValue
    };

    this.httpClient.updateQuestion(updateObj).then((question) => {
      this.setState({ is_selected: newValue });
    });
  }

  render() {
    return(
      <input disabled={this.disabled} type="checkbox" checked={this.state.is_selected} onChange={this.toggleSelection} />
    );
  }
}
