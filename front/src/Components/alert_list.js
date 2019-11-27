import React, {Component} from 'react';
import url from "../url";

class Alert_list extends Component {

    constructor(props) {
        super(props);
        this.state = {
            user_id: localStorage.getItem('user_id'),
            token: 'Token ' + localStorage.getItem('token'),
            alert: []
        };
    };

    componentDidMount = () => {
        var that = this;
        fetch(url + `/user/` + this.state.user_id + '/', {
            headers: {
                'Access-Control-Allow-Origin': '*',
                'Content-Type': 'application/json',
                'Authorization': this.state.token
            },
            method: 'get',
        })
            .then(resp => resp.json())
            .then(function (data) {
                if (data) {
                    that.setState({alert: data.alert})
                }
            })
    };

    UpdateRedirect = (data) => {
        this.props.history.push({pathname:'/alert/update', alert:data})
    };


    render() {

        const {alert} = this.state;

        return (
            <div className="container">
                <div className='row'>
                    <div className="col-xl-5 col-sm-12 mx-auto d-block">
                        <a href="/">
                            <button className="btn btn-light btn-sm mb-3">Retour</button>
                        </a>
                        <div className="">
                            <table>
                                <thead>
                                <tr>
                                    <th>Cryptomonnaie</th>
                                    <th>Type d'alerte</th>
                                    <th>Valeur</th>
                                </tr>
                                </thead>
                                <tbody>
                                {alert.map((data) => {
                                    return (
                                        <tr>
                                            <td>{data.ctr}</td>
                                            <td>{data.comparate === 0 ? 'en dessous de ' : 'au dessus de '}</td>
                                            <td>{data.value}</td>
                                            <td><button onClick={() => this.UpdateRedirect(data)}>Modifier</button></td>
                                        </tr>
                                    )
                                })}
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        )
    }
}

export default Alert_list;
