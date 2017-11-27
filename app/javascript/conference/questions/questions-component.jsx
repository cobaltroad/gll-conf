import React from 'react'
import HttpClient from '../http-client/http-client'

export default class Questions extends React.Component {
  constructor(props) {
    super(props);

    this.httpClient = HttpClient.instance;
  }

  render() {
    this.httpClient.questions();
    return(
      <div>questions</div>
    );
  }
}
