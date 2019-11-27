import React, {Component} from 'react';
import App from '../App.js';
import url from "../url";

class Connexion extends Component {

    constructor(props){
        super(props);
        this.state = {
            username : '',
            password : '',
            result : <div></div>
        };
    };

    setPassword = (e) => {
        this.setState({password : e.target.value});
    };

    setUsername = (e) => {
        this.setState({username : e.target.value});
    };

    login = (e) => {
        e.preventDefault();
        var that = this;
        fetch(url+'/login/', {
            headers: {
                'Access-Control-Allow-Origin': '*',
                'Content-Type':'application/json',
            },
            method: 'post',
            body: JSON.stringify({
                username: this.state.username,
                password: this.state.password
            })
        })
            .then(resp => resp.json())
            .then(function(data) {
                console.log(data)
                if (data.token) {
                   localStorage.setItem('token', data.token)
                   localStorage.setItem('user_id', data.user_id)
                    new App();
                    that.props.history.push('/')
               } else {
                   that.setState({result :<div className="alert alert-danger mt-3">Identifiants incrorrct</div>});
               }
        })
    };


    render() {
        return (
            <div className="container">
                <div className='row'>
                    <div className="col-xl-5 col-sm-12 mx-auto d-block">
                        <a href="/">
                            <button className="btn btn-light btn-sm mb-3">Retour</button>
                        </a>
                        <form method="post"  onSubmit={this.login}>
                            <div className="form-group">
                                <label htmlFor="username">Username :</label>
                                <input className="form-control" onChange={this.setUsername} value={this.username} id="username" type="text"/>
                            </div>
                            <div className="form-group">
                                <label htmlFor="password">Password :</label>
                                <input className="form-control" onChange={this.setPassword} value={this.password} id="password" type="password"/>
                            </div>
                            <button className="btn btn-primary btn-lg mx-auto d-block mt-5" type="submit">Connexion
                            </button>
                        </form>
                        {this.state.result}
                    </div>
                </div>
            </div>
        )
    }
}

export default Connexion;
