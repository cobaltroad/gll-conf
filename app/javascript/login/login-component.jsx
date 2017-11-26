import React from 'react'

export default class LoginComponent extends React.Component {
  render() {
    return(
      <form>
        <input placeholder="Email Address" />
        <button>Log In</button>
      </form>
    );
  }
}
