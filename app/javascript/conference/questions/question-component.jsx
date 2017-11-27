import React from 'react'

export default class Question extends React.Component {
  constructor(props) {
    super(props);
    this.state = { ...props };
  }

  render() {
    return(
      <div>{this.state.body}</div>
    );
  }
}
