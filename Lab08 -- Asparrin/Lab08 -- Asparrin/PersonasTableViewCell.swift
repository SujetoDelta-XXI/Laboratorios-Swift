//
//  PersonasTableViewCell.swift
//  Lab08 -- Asparrin
//
//  Created by Mac11 on 14/10/25.
//

import UIKit

class PersonasTableViewCell: UITableViewCell {

    @IBOutlet weak var PersonaImagen: UIImageView!
    
    @IBOutlet weak var PersonaNombre: UILabel!
    
    @IBOutlet weak var PersonaCurso: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
