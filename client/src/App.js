import React, { Component } from 'react';
import Fib1 from './fib1.jpg'
import './App.css';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';
import OtherPage from './OtherPage';
import Fib from './Fib';

class App extends Component {
  render() {
    return (
      <Router>
        <div className="App">
          <header className="App-header">
            <img src={Fib1} className="App-logo" alt="logo" />
            <br/>
            <br/>
            <br/>
            <h1 className="App-title">Kubernetes Fib Calculator</h1>
          </header>
          <div>
            <Route exact path="/" component={Fib} />
            <Route path="/otherpage" component={OtherPage} />
          </div>
        </div>
      </Router>
    );
  }
}

export default App;
