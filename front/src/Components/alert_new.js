import React, {Component} from 'react';
import url from "../url";

class Alert_new extends Component {

    constructor(props) {
        super(props);
        this.state = {
            user_id: localStorage.getItem('user_id'),
            token: 'Token ' + localStorage.getItem('token'),
            ctr: 'Bitcoin',
            alert_type: 0,
            value: 0,
            comparate: 0,
            result: ''
        };
    };

    setCtr = (e) => {
        this.setState({ctr: e.target.value});
    };

    setValue = (e) => {
        this.setState({value: e.target.value});
    };

    setComparate = (e) => {
        this.setState({comparate: e.target.value});
    };

    create_alert = (e) => {
        console.log(this.state)
        e.preventDefault()
        var that = this;
        fetch(url + `/alert/create/`, {
            headers: {
                'Access-Control-Allow-Origin': '*',
                'Content-Type': 'application/json',
                'Authorization': this.state.token
            },
            method: 'put',
            body: JSON.stringify({
                id_user: this.state.user_id,
                ctr: this.state.ctr,
                alert_type: this.state.alert_type,
                value: this.state.value,
                comparate: this.state.comparate
            })
        })
            .then(function(resp){
            console.log(resp)
                that.props.history.push('/alert/list')
        })
    };


    render() {
        const test = <div className="container">
            <div className='row'>
                <div className="col-xl-5 col-sm-12 mx-auto d-block">
                    <a href="/">
                        <button className="btn btn-light btn-sm mb-3">Retour</button>
                    </a>
                    <form method="post" onSubmit={this.create_alert}>
                        <div className="form-group">
                            <label htmlFor="ctr">Cryptomonnaie :</label>
                            <select name="ctr" onChange={this.setCtr} value={this.state.ctr} id="ctr">
                                <option selected value="Bitcoin">Bitcoin</option>
                                <option value="Ethereum">Ethereum</option>
                                <option value="Litecoin">Litecoin</option>
                                <option value="Bitcoin Cash">Bitcoin Cash</option>
                                <option value="Binance Coin">Binance Coin</option>
                                <option value="NEO">NEO</option>
                                <option value="EOS">EOS</option>
                            </select>
                        </div>
                        <div className="form-group">
                            <label for="value">Seuil de l'alerte :</label>
                            <input className="form-control" onChange={this.setValue} value={this.value} id="value"
                                   type="number"/>
                        </div>
                        <div className="form-group">
                            <label for="comparate">Declenchement par rapport au seuil</label>
                             <select name="comparate" onChange={this.setComparate} value={this.comparate} id="comparate">
                                <option value="0">En dessous</option>
                                 <option value="1">Au dessus</option>
                             </select>
                        </div>
                        <button className="btn btn-primary btn-lg mx-auto d-block mt-5" type="submit">Creation de l'alerte
                        </button>
                    </form>
                    {this.state.result}
                </div>
            </div>
        </div>;
        return (test);
    }
}

export default Alert_new;
