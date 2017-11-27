import React from 'react'
import {
  BrowserRouter as Router,
  Route,
  Redirect
} from 'react-router-dom'
import DashboardComponent from './dashboard-component'
import AuthenticationComponent from './authentication-component'
import HttpClient from '../http-client/http-client'

const ConferenceApp = (props) => (
  <Router>
    <div>
      <Route path='/authentication' component={AuthenticationComponent} />
      <PrivateRoute path='/' component={DashboardComponent} />
    </div>
  </Router>
)

const PrivateRoute = ({ component: Component, ...rest }) => (
  <Route {...rest} render={props => (
    HttpClient.instance.isLoggedIn() ? (
      <Component {...props}/>
    ) : (
      <Redirect to={ { pathname: '/authentication' } }/>
    )
  )}/>
)

export default ConferenceApp
