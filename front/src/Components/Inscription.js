import React, {Component} from 'react';
import App from '../App.js';
import url from "../url";

class Inscription extends Component {

    constructor(props){
        super(props);
        this.state = {
            username : '',
            email : '',
            password : '',
            result : <div></div>

        };
    }

     setUsername = (e) => {
        this.setState({username : e.target.value});
    };

    setPassword = (e) => {
        this.setState({password : e.target.value});
    };

    setEmail = (e) => {
        this.setState({email : e.target.value});
    };

    register = (e) => {
        e.preventDefault();
        var that = this;
       fetch(url+`/user/register/`, {
            headers: {
                'Access-Control-Allow-Origin': '*',
                'Content-Type':'application/json',
            },
            method: 'put',
            body: JSON.stringify({
                username: this.state.username,
                email: this.state.email,
                password: this.state.password
            })
        }).then(function(data) {
               if (data.statusText !== "Bad Request") {
                    new App();
                    that.props.history.push('/connexion')
               } else {
                   console.log(data)
               }
        })
    };

    render() {
        const test = <div className="container">
                <div className='row'>
                    <div className="col-xl-5 col-sm-12 mx-auto d-block">
                        <a href="/">
                            <button className="btn btn-light btn-sm mb-3">Retour</button>
                        </a>
                        <form method="post"  onSubmit={this.register}>
                            <div className="form-group">
                                <label htmlFor="username">Username :</label>
                                <input className="form-control" onChange={this.setUsername} value={this.username} id="username"
                                       type="text"/>
                            </div>
                            <div className="form-group">
                                <label for="email">Email :</label>
                                <input className="form-control" onChange={this.setEmail} value={this.email} id="email" type="email"/>
                            </div>
                            <div className="form-group">
                                <label for="password">Password :</label>
                                <input className="form-control" onChange={this.setPassword} value={this.password} id="password" type="password"/>
                            </div>
                            <button className="btn btn-primary btn-lg mx-auto d-block mt-5" type="submit">Inscription</button>
                        </form>
                        {this.state.result}
                    </div>
                </div>
        </div>;
        return (test);
    }
}

export default Inscription;
