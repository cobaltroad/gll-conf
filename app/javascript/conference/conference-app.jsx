import React from 'react'
import {
  BrowserRouter as Router,
  Route
} from 'react-router-dom'
import DashboardComponent from './dashboard-component'

const ConferenceApp = (props) => (
  <Router>
    <div>
      <Route path='/' component={DashboardComponent} />
    </div>
  </Router>
)

export default ConferenceApp
