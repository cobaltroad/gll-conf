import React from 'react'
import {
  BrowserRouter as Router,
  Route,
  Redirect
} from 'react-router-dom'
import DashboardComponent from './dashboard-component'
import AuthenticationComponent from './authentication/authentication-component'
import HttpClient from './http-client/http-client'
import LogoutComponent from './authentication/logout-component'

const ConferenceApp = (props) => (
  <Router>
    <div>
      <Route path='/login' component={AuthenticationComponent} />
      <Route render={() => (
        HttpClient.instance.isLoggedIn() ? (
          <LogoutComponent/>
        ) : (
          null
        )
      )}/>
      <PrivateRoute exact path='/' component={DashboardComponent} />
    </div>
  </Router>
)

const PrivateRoute = ({ component: Component, ...rest }) => (
  <Route {...rest} render={props => (
    HttpClient.instance.isLoggedIn() ? (
      <Component {...props}/>
    ) : (
      <Redirect to={ { pathname: '/login' } }/>
    )
  )}/>
)

export default ConferenceApp
