import React from 'react'

export default class SelectQuestion extends React.Component {
  constructor(props) {
    super(props);
    this.state = { ...props }
  }

  selectQuestion = (e) => {
    console.log("SELECTING", e.target.value);
  }

  render() {
    return(
      <input type="checkbox" checked={this.state.is_selected} onClick={this.selectQuestion} />
    );
  }
}
