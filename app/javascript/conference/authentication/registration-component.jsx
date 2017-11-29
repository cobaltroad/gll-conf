import React from 'react'
import HttpClient from '../http-client/http-client'

export default class RegistrationComponent extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      email: '',
      password: '',
      is_moderator: false,
      addError: null
    };

    this.httpClient = HttpClient.instance;
  }

  onChange = (e) => {
    const state = this.state;
    state[e.target.name] = e.target.value;
    state['addError'] = null;
    this.setState(state);
  }

  toggleSelection = (e) => {
    const newValue = !this.state.is_moderator;
    this.setState({ is_moderator: newValue });
  }

  onSubmit = (e) => {
    e.preventDefault();
    const state = this.state;
    this.httpClient.addUser(state).then((user) => {
      this.props.onRegister(state)
    }).catch((error) => {
      this.setState({ addError: error.response.data.message });
    });
  }

  render() {
    return(
      <div>
        <form onSubmit={this.onSubmit}>
          <input name="email" placeholder="Email Address" onChange={this.onChange} />
          <input type="password" name="password" placeholder="Password" onChange={this.onChange} />
          Select if moderator:
          <input type="checkbox" name="is_moderator" onChange={this.toggleSelection} />
          <button type="submit">Register</button>
        </form>
        <div>{this.state['addError']}</div>
      </div>
    );
  }
}
