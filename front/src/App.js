import React from 'react';
import './App.css';
import Inscription from './Components/Inscription';
import Connexion from './Components/Connexion';
import Home from './Components/Home';
import Alert_list from "./Components/alert_list";
import Alert_new from "./Components/alert_new";
import Alert_update from "./Components/alert_update";
import {Component} from 'react';
import {BrowserRouter as Router, Route, withRouter, /*Switch*/} from "react-router-dom";
import {/*Link*/ Redirect} from 'react-router-dom';
import url from "./url";

const fakeAuth = {
    setsession() {
        localStorage.getItem('token') === null
            ? this.isAuthenticated = false
            : this.isAuthenticated = true
    },
    authenticate(cb) {
        this.isAuthenticated = true
        setTimeout(cb, 100)
    },
    signout(cb) {
        var that = this;
        fetch(url + `/logout/`, {
            headers: {
                'Access-Control-Allow-Origin': '*',
                'Content-Type': 'application/json',
                'Authorization': "Token " + localStorage.getItem('token')
            },
            method: 'get'
        });
        this.isAuthenticated = false
        localStorage.clear()
        setTimeout(cb, 100)
    }
};

/*const Public = () => <h3>Public</h3>*/
const Protected = () => <h3>Protected</h3>

const PrivateRoute = ({component: Component, ...rest}) => (
    <Route {...rest} render={(props) => (
        fakeAuth.isAuthenticated === true
            ? <Component {...props} />
            : <Redirect to='/protected'/>
    )}/>
);

const AuthButton = withRouter(({history}) => (
    fakeAuth.isAuthenticated ? (
        <button className="btn btn-danger mx-auto d-block btn-sm" onClick={() => {
            fakeAuth.signout(() => history.push('/'))
        }}>Logout</button>

    ) : (
        <div></div>
    )
));

class App extends Component {

    constructor(props) {
        super(props);
        fakeAuth.setsession();
        console.log(fakeAuth.isAuthenticated)
        console.log(localStorage.getItem('token'))
    }

    render() {

        return (
            <div className="container col-xl-6">
                <Router>
                    <div className="mt-2"><AuthButton/>
                    </div>
                    <Route path="/" component={Home} exact/>
                    <Route path="/connexion" component={Connexion} exact/>
                    <Route path="/inscription" component={Inscription} exact/>
                    <Route path='/protected' component={Protected}/>
                    <PrivateRoute path='/alert/list' component={Alert_list}/>
                    <PrivateRoute path='/alert/new' component={Alert_new}/>
                    <PrivateRoute path='/alert/update' component={Alert_update}/>
                </Router>
            </div>
        );
    }
}

export default App;