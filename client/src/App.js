import React from 'react';
import logo from './logo.svg';
import './App.css';

import { BrowserRouter as Router, Route, Link} from 'react-router-dom';
import Fib from './Fib';
import OtherPage from './OtherPage';

function App() {
  return (
    <Router>
      <div className="App">
        <div>
          <p>
            App.js was modified adding the links
            Fib.js and OtherPage.js created by me
            the client/package.json was modified adding two dependencies
          </p>
          
          <Link to="/">Home</Link>
          <Link to="/otherpage">Other Page</Link>
        </div>
        <br/>
        <div>
            <Route exact path="/" component={Fib} />
            <Route exact path="/otherpage" component={OtherPage} />
        </div>
      </div>
    </Router>
  );
}

export default App;
