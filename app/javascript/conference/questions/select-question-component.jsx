import React from 'react'
import HttpClient from '../http-client/http-client'

export default class SelectQuestion extends React.Component {
  constructor(props) {
    super(props);
    this.state = { ...props }

    this.httpClient = HttpClient.instance;
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
      <input type="checkbox" checked={this.state.is_selected} onChange={this.toggleSelection} />
    );
  }
}
