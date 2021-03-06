import React, {Component} from 'react';
import url from "../url";

class Alert_update extends Component {

    constructor(props) {
        super(props);
        this.state = {
            user_id: localStorage.getItem('user_id'),
            token: 'Token ' + localStorage.getItem('token'),
            id_alert: this.props.location.alert.id,
            ctr: this.props.location.alert.ctr,
            alert_type: this.props.location.alert.alert_type,
            value: this.props.location.alert.value,
            comparate: this.props.location.alert.comparate,
            result: ''
        };


    };

    componentDidMount() {
       
    }

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
        e.preventDefault()
        var that = this;
        fetch(url + `/alert/update/`, {
            headers: {
                'Access-Control-Allow-Origin': '*',
                'Content-Type': 'application/json',
                'Authorization': this.state.token
            },
            method: 'post',
            body: JSON.stringify({
                id: this.state.id_alert,
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
                            <select name="ctr" onChange={this.setCtr} defaultValue={this.state.ctr} id="ctr">
                                <option value="Bitcoin">Bitcoin</option>
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
                            <input className="form-control" onChange={this.setValue} defaultValue={this.state.value} id="value"
                                   type="number"/>
                        </div>
                        <div className="form-group">
                            <label for="comparate">Declenchement par rapport au seuil</label>
                             <select name="comparate" onChange={this.setComparate} defaultValue={this.state.comparate} id="comparate">
                                <option value="0">En dessous</option>
                                 <option value="1">Au dessus</option>
                             </select>
                        </div>
                        <button className="btn btn-primary btn-lg mx-auto d-block mt-5" type="submit">Modifier l'alerte
                        </button>
                    </form>
                    {this.state.result}
                </div>
            </div>
        </div>;
        return (test);
    }
}

export default Alert_update;
